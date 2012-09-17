/*
 * Sonar Web Plugin
 * Copyright (C) 2010 Matthijs Galesloot
 * dev@sonar.codehaus.org
 *
 * Licensed under the Apache License, Version 2.0 (the "License")
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
package org.sonar.plugins.ftl.core;

import org.junit.Before;
import org.junit.Test;
import org.sonar.api.batch.bootstrap.ProjectDefinition;
import org.sonar.api.batch.bootstrap.ProjectReactor;
import org.sonar.api.config.Settings;
import org.sonar.plugins.ftl.api.FtlConstants;
import org.sonar.test.TestUtils;

import static org.fest.assertions.Assertions.assertThat;

public class FtlProjectBuilderTest {

  private FtlProjectBuilder ftlProjectBuilder;
  private Settings settings;
  private ProjectReactor reactor;
  private ProjectDefinition root;

  @Before
  public void init() throws Exception {
    root = ProjectDefinition.create();
    root.setBaseDir(TestUtils.getResource("src"));
    reactor = new ProjectReactor(root);
    settings = new Settings();
    ftlProjectBuilder = new FtlProjectBuilder(reactor, settings);
  }

  @Test
  public void shouldNotChangeAnythingIfNoProperty() throws Exception {
    ftlProjectBuilder.build(reactor);

    assertThat(root.getSourceDirs()).isEmpty();
  }

  @Test
  public void shouldChangeSourceDirIfPropertyPresent() throws Exception {
    settings.appendProperty(FtlConstants.SOURCE_DIRECTORY_PROP_KEY, "main/code");
    ftlProjectBuilder.build(reactor);

    assertThat(root.getSourceDirs()).containsOnly(TestUtils.getResource("src/main/code").getAbsolutePath());
  }

  @Test
  public void shouldChangeSourceDirIfPropertyPresentButBlank() throws Exception {
    settings.appendProperty(FtlConstants.SOURCE_DIRECTORY_PROP_KEY, " ");
    ftlProjectBuilder.build(reactor);

    assertThat(root.getSourceDirs()).isEmpty();
  }

}
