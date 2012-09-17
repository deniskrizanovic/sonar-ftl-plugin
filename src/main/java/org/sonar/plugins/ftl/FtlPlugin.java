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
package org.sonar.plugins.ftl;

import org.sonar.api.Extension;
import org.sonar.api.Properties;
import org.sonar.api.Property;
import org.sonar.api.SonarPlugin;
import org.sonar.plugins.ftl.api.FtlConstants;
import org.sonar.plugins.ftl.core.*;
import org.sonar.plugins.ftl.core.FtlCodeColorizerFormat;
import org.sonar.plugins.ftl.duplications.FtlCpdMapping;
import org.sonar.plugins.ftl.rules.FtlRulesRepository;
import org.sonar.plugins.ftl.rules.SonarWayProfile;

import java.util.ArrayList;
import java.util.List;

/**
 * Ftl Plugin publishes extensions to sonar engine.
 *
 * @author Matthijs Galesloot
 * @since 1.0
 */
@Properties({
  @Property(key = FtlConstants.CPD_MINIMUM_TOKENS_PROP_KEY, defaultValue = "70",
    name = "Minimum tokens",
    description = "The number of duplicate tokens above which a HTML block is considered as a duplicated.",
    global = true,
    project = true),
  @Property(key = FtlConstants.SOURCE_DIRECTORY_PROP_KEY,
    name = "Source directory",
    description = "Source directory that will be scanned.",
    defaultValue = FtlConstants.SOURCE_DIRECTORY_DEF_VALUE,
    // do not display this property in the UI as it is deprecated since 1.2
    global = false,
    project = false)})
public final class FtlPlugin extends SonarPlugin {

  public List<Class<? extends Extension>> getExtensions() {
    List<Class<? extends Extension>> list = new ArrayList<Class<? extends Extension>>();

    // extension used to allow backward compatibility for the "sonar.ftl.sourceDirectory" property
    list.add(FtlProjectBuilder.class);

    // ftl language
    list.add(Ftl.class);
    // ftl files importer
    list.add(FtlSourceImporter.class);

    // ftl rules repository
    list.add(FtlRulesRepository.class);

    // profiles
    list.add(SonarWayProfile.class);

    // ftl sensor
    list.add(FtlSensor.class);

    // Code Colorizer
    list.add(FtlCodeColorizerFormat.class);
    // Copy/Paste detection mechanism
    list.add(FtlCpdMapping.class);

    return list;
  }

}
